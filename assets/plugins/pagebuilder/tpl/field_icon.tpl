<style>
    .field[data-field=<?= $name?>] .icons i {
        font-size: 1.5em; 
        margin-top: 5px; 
        margin-right: 5px
    }
    .field[data-field=<?= $name?>] .icons i.active {
        color: green
    }
    .field[data-field=<?= $name?>] .icon-prev i {
        margin: 5px 0 5px 12px;
        font-size: 1.5em;
    }
</style>

<div class="field type-<?= $field['type'] ?> <?= $layout ?>" data-field="<?= $name ?>">
    <?php if (!empty($field['caption'])): ?> 
        <div class="field-name"><?= $field['caption'] ?></div>
    <?php endif; ?> 

    <div class="d-flex">
        <input type="text" name="contentblocks_<?= $name ?>" value="<?= htmlentities($value) ?>">
        <div class="icon-prev" style="width:50px"><?= $value ?></div>
    </div>

    <?php if (isset($field['icons'])): ?>
        <div class="icons">
            <?php foreach ($field['icons'] as $icon): ?>
                <i class="fa fa-<?= $icon ?>"></i>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</div>