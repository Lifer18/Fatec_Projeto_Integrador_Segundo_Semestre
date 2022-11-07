<h3 class="mb-5">Edição de usuário</h3>

<form action="" method="POST">
    <div class="form-group">
        <label for="userEmail">E-mail</label>
        <input class="form-control" type="email" name="email" placeholder="Insira o e-mail" value="<?php echo $data['user']['email'];?>">
    </div>
    <div class="form-group">
        <label for="userPassworld">Senha</label>
        <input class="form-control" id="userPassworld" type="password" name="passworld" placeholder="Insira a senha" value="">
    </div>

    <br>
    <button type="submit" class="btn btn-primary">Salvar</button>

    <hr>

</form>
    <a href="/admin/users/<?php echo $data['user']['id'];?>" class="btn btn-secondary">Voltar</a>