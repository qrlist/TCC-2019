<?php
session_start();
if (isset($_SESSION['logado']) and $_SESSION['logado'] == 'sim'){
  require __DIR__.'/cabecalho_geral.php';
  require __DIR__.'/../conexao/Connection.php';
  ?>

  <body>

   <div class="ui width grid">
    <div class="one wide column "></div>
    <div class="fourteen wide column">

      <div class="ui middle aligned divided list marginUsu">
        <div class="item">
          <div class="right floated content">
            <a href="usuario_editar.php"><div class="ui button">Editar</div></a>
            
            <?php

            ?>
          </div>
          <div class="header"><h3><?php echo $_SESSION['primeiro_nome'].' '.$_SESSION['sobrenome']; ?></h3></div>
          <div class="ui horizontal bulleted list">
            <div class="item"><?php echo $_SESSION['email'] ?>;</div>
            <div class="item"><?php echo $_SESSION['cpf'] ?></div>
            <div class="item"><?php echo $_SESSION['telefone']; ?></div>
          </div>
        </div>
      </div>

      <div class="ui horizontal divider cor_tercearia">
        Minhas listas
      </div>

      <a href="usuario_nl.php">
        <button class="ui primary button direita">+ Nova lista Sem QrCode</button>
      </a>
      <a href="nome_lista_qr.php">
        <button class="ui primary button direita">+ Nova lista Com QrCode</button>
      </a>

       <div class="ui grid">
    <div class="two wide column "></div>

      <?php
      $conexaos = new Connection();
      $recebeConexao = $conexaos->conectar();
      $sql_cnpj_lista = "SELECT DISTINCT cnpj_lista,foto_mercado,nome_mercado from usuario, mercado, lista where cnpj_lista = cnpj and cpf_lista = cpf and cpf = '{$_SESSION['cpf']}';";
      //print_r($sql_cnpj_lista);
      //exit();
      $cnpjs = $recebeConexao->query($sql_cnpj_lista)->fetch(PDO::FETCH_ASSOC);

      $sql_produtos = "select distinct nome_lista,valor_lista,cod_lista from lista,usuario where cpf_lista = cpf and cpf = '{$_SESSION['cpf']}'";
      $produtos = $recebeConexao->query($sql_produtos)->fetchAll(PDO::FETCH_ASSOC);

      for ($i= 0; $i < sizeof($produtos) ; $i++) {
       foreach ($cnpjs as $key =>$cnpj){
         foreach ($cnpj as $nome => $vai) {
          $produtos[$i][$nome] = $vai;
          $produtos[$i][$nome] = $vai;
          $produtos[$i][$nome] = $vai;
        }
      }
    }

    foreach ($produtos as $key => $produto) {
      $cod_lista = $produto['cod_lista']
      ?>


     
        
<div class="three wide column  ">
    <div class="ui special cards Cardsss">
      <div class="card direi">
  <div class="content">
    <div class="header"><?php echo $produto['nome_lista'] ?></div>
  </div>
  <div class="content">
    <div class="ui sub header"><?php echo "Preço Total:  R$".$produto['valor_lista']."" ?></div>
    <div class="ui small feed">
      <div class="event">
        <div class="content">
          <div class="summary">
             <?php echo $produto['nome_mercado']; ?>
          </div>
        </div>
      </div>
  </div>
 <div class="extra content">
          <form action="../views/confirmacao_exclusao_lista.php" method="post">
            <button value="<?php echo $produto['cod_lista'];?>" name="cod_lista" class="ui left button red">Excluir</button>
          </form>
          <form action="../views/lista_vizualizar.php" method="post">
            <button value="<?php echo $produto['cod_lista'];?>" name="cod_lista" class="ui right floated button green">Vizualizar</button>
            <input type="hidden" name="cnpj" value="<?=$cnpjs[0]['cnpj_lista']?>">
          </form>
        </div>
</div>
</div>


        
      

    </div>
  </div>
<?php }?>
</div>
<div class="one wide column "></div>
</div>

</body>
<?php
//  include 'footer.php';
}else{
 header('location: ../views/usuario_login.php');
}