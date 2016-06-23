library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all;
use std.textio.all;

entity memoria is
  generic(
    -- nome do arquivo que contem a descricao do conteudo de memoria inicial
    NA : string := "sort_mram.txt";

    -- Estabelece quantos bits o endereco tera e, portanto,
    -- define o comprimento maximo do espaco de enderecamento (tamanho da memoria)
    addr_len : integer := 16;  -- quantidade de bits de endereco

    -- Define o tamanho (em bits) de uma palavra da memoria
    word_len : integer := 32;

    -- diversos tempos da memoria
    Tz : time := 2 ns;
    Twrite : time := 5 ns;
    Tsetup : time := 2 ns;
    Tread : time := 5 ns
  );
  port (
    Address : in std_logic_vector(addr_len - 1 downto 0);
    ReadData : out std_logic_vector(word_len - 1 downto 0);
    WriteData : in std_logic_vector(word_len - 1 downto 0);

    -- pronto: out std_logic;
    rw : in std_logic;
    clk : in std_logic
  );
end entity ; -- memoria

architecture behave of memoria is

  ---- Declaracao do tipo principal MEMORIA ----
  type tMemoria is array (0 to 2**(addr_len-2) - 1) of std_logic_vector(word_len - 1 downto 0);


  -- sinal (ou matriz) que ira conter todo o conteudo presente na memoria
  -- eh o coracao da entidade
  signal conteudoMem : tMemoria := (others => (others => '0'));


  -- funcao responsavel por ler o arquivo e carregar o conteudo inicial da memoria ram
  function fill_memory return tMemoria is
    file mem_descript_file : text open read_mode is NA;
    variable linha_buff : line;
    variable linha_bin : std_logic_vector(addr_len + word_len - 1 downto 0);
    variable addr : integer range 0 to (2**(addr_len-2) - 1);
    variable mem_temp : tMemoria := (others => (others => '0'));
  begin
    -- percorre o arquivo todo, lendo linha a linha
    while not endfile(mem_descript_file) loop
      -- carrega, vinda do arquivo, uma linha em formato string
      readline(mem_descript_file, linha_buff);
      -- converte a string lida em formato do vhdl, ou seja, std_logic_vector
      read(linha_buff, linha_bin);
      -- obtem o campo de endereco, ao qual quer-se escrever um dado
      addr := to_integer(unsigned(linha_bin(addr_len+word_len-1 downto word_len)))/4;
      -- escreve o dado no endereco especificado
      mem_temp(addr) := linha_bin(word_len - 1 downto 0);
    end loop;
    -- retorna uma memoria preenchida
    return mem_temp;
  end fill_memory;

-- inicio da architecture propriamente dita
begin

  CargaInicial_et_MemProcess : process(clk, rw, Address)
    variable ehInicio: std_logic := '1';
    variable addr : integer range 0 to (2**(addr_len-2) - 1);
  begin
    -- Roda somente uma vez na inicializacao
    if ehInicio = '1' then
      ehInicio := '0';
      -- Insere o conteudo na memoria
      conteudoMem <= fill_memory;
    end if;
    if clk'event and clk='1' then
      addr := to_integer(unsigned(Address))/4;
      case rw is
        when '0' =>
			if addr > (2**(addr_len-2)-1) then
				ReadData <= (others => 'U');
			else
				ReadData <= conteudoMem(addr);
			end if;
            -- pronto <= '1';
        when '1' =>
			conteudoMem(addr) <= WriteData;
			--ReadData <= conteudoMem(addr);
            -- pronto <= '1';
        when others =>
            Null;
      end case;
    end if;
  end process ; -- CargaInicial
  
end architecture ; -- behave
