<h3 class="mb-5">Lista de usuários cadastrados</h3>

<table class="table table-hover">
    <thead>
        <tr>
            <th>#</th>
            <th>email</th>
            <th></th>
        </tr>
    </thead>
    <tbody>
        <?php foreach ($data['users'] as $user): ?>
            <tr>
                <td><?php echo $user['id']; ?></td>
                <td><?php echo $user['email']; ?></td>
                <td class="text-right"> 
                    <a href="/admin/users/<?php echo $user['id']; ?>" class="btn btn-primary btn-sm">Ver</a>
                </td>
            </tr>
        <?php endforeach; ?>
    </tbody>
</table>

<a class="btn btn-secondary" href="/admin/users/create">Novo</a>