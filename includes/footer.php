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
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</body>

</html>