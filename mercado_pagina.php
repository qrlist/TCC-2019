<?php
session_start();
require __DIR__.'/cabecalho_geral.php';
require __DIR__.'/../controllers/mercado.php';
?>
<body>
  <div class="ui horizontal divider cor_tercearia marginUsu">
    Mercados cadastrados
  </div>   
  <div class="ui grid">
    <div class="two wide column "></div>

    <?php
    $conexao = new Connection();
    $recebeConexao = $conexao->conectar();
    $sql_mercados = "select distinct count(cod_produto) as qtd_prod,nome_mercado,cnpj,telefone_mercado,foto_mercado,email_mercado from mercado,produtos where cnpj_prod = cnpj GROUP BY cnpj;";
    $mercado = $recebeConexao->query($sql_mercados)->fetchAll(PDO::FETCH_ASSOC);

    foreach ($mercado as $key => $value) {
      $cod_mercado = $value['cnpj'];
      echo '
      <div class="three wide column  ">

      <div class="ui special cards Cardsss">
      <div class="card direi">
      <div class="blurring dimmable image">
      <div class="content">
        <h3>'.$value['nome_mercado'] .'<h3>
      </div>
      <img class="img_mercado" src="../../imagens/foto_mercado/'.$value['foto_mercado'].'">
      <div class="content">
      <p></p>
      <p class="ui sub header">Telefone: '.$value['telefone_mercado'].'</p>
      <p class="ui sub header">Email: '.$value['email_mercado'].'</p>
      <p class="ui sub header">Produtos: '.$value['qtd_prod'].'</p>
      </div>
      </div>
      </div>
      </div>
      </div>


      ';


    }
    ?>
