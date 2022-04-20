<h2><?= esc($title) ?></h2>

<?php if (! empty($surnames) && is_array($surnames)): ?>

    <?php foreach ($surnames as $surname): ?>

        <h3><?= esc($surname['name']) ?></h3>

        <div class="main">
            <?= esc($surname['surname']) ?>
        </div>
        <p><a href="/surnames/<?= esc($surname['name'], 'url') ?>">View person</a></p>

    <?php endforeach ?>

<?php else: ?>

    <h3>No Surnames</h3>

    <p>Unable to find any surnames of people.</p>

<?php endif ?>