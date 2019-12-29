<aside class="col-12 col-md-4 blog-sidebar">
    <div class="p-4 mb-3 rounded text-center">
        <h4 class="font-bold">About</h4>
        <p class="mb-0"> This is a simple blog built with PHP/MYSQL.</p>
    </div>

    <div class="p-4 text-center">
        <h4 class="font-bold">Categories</h4>
        <?php if($categories): ?>
        <ol class="list-unstyled mb-0">
            <?php foreach($categories as $category) : ?>
            <li><a href="/all-posts?category=<?= $category['id'] ?>"><?= $category['name'] ?></a></li>
            <?php endforeach; ?>
        </ol>
        <?php else: ?>
        <p>Ther are no categories yet</p>
        <?php endif; ?>
    </div>

</aside><!-- /.blog-sidebar -->

</div><!-- /.row -->

</main><!-- /.container -->

<footer class="blog-footer text-center mt-5">
    <p>PHPLoversBlog &copy; 2019 </p>
</footer>
</body>

</html>