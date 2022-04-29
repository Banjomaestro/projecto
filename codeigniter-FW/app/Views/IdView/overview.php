<h2><?= esc($title) ?></h2>

<?php if (! empty($internaute /*nom de la BDD*/) && is_array($internaute)): ?>

    <?php foreach ($internaute as $identifiants_item): ?>

        <h3><?= esc($identifiants_item['Identifiant']) ?></h3>

        <div class="main">
            <?= esc($identifiants_item['mdp']) ?>
        </div>
        <p><a href="/IdView/<?= esc($identifiants_item['Identifiant'], 'url') ?>">View account</a></p>

    <?php endforeach ?>

<?php else: ?>

    <h3>No ID</h3>

    <p>Unable to find any id of people.</p>

<?php endif ?>