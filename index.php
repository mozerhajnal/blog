<?php
$routes = [
    'GET' => [
        '/'              => 'homeHandler',
        '/all-posts'     => 'getAllPostsHandler',
        '/single-post'   => 'singlePostHandler',
        '/dashboard'     => 'adminHandler',
        '/add-post'      => 'addPostHandler',
        '/add-category'  => 'addCategoryHandler',
        '/edit-post'     => 'editPostHandler',
        '/edit-category' => 'editCategoryHandler'
   
    ],
    'POST' => [
        '/delete-country'   => 'deleteCountryHandler',
        '/create-post'      => 'createPostHandler',
        '/create-category'  => 'creatCategoryHandler',
        '/update-post'      => 'updatePostHandler',
        '/delete-post'      => 'deletePostHandler',
        '/update-category'  => 'updateCategoryHandler',
        '/delete-category'  => 'deleteCategoryHandler'
 
    ],
];

$url = $_SERVER['REQUEST_URI'];
$path = parse_url($url)['path'];
$method = $_SERVER['REQUEST_METHOD'];

$handler = $routes[$method][$path] ?? '';

if ($handler && is_callable($handler)) {
        //Get Heroku ClearDB connection information
        $cleardb_url      = parse_url(getenv("CLEARDB_DATABASE_URL"));
        $cleardb_server   = $cleardb_url["host"];
        $cleardb_username = $cleardb_url["user"];
        $cleardb_password = $cleardb_url["pass"];
        $cleardb_db       = substr($cleardb_url["path"],1);
    
        $conn = new mysqli($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db);
        $conn->set_charset('utf8');
        $handler($conn, $_GET,$_POST);
} else {
    echo '404';
}

function getAllEntities(mysqli $conn, string $resourceName)
{
    $result = $conn->query('SELECT * FROM ' . $resourceName.' ORDER BY id DESC');
    $ret = [];
    while ($data = $result->fetch_assoc()) {
        $ret[] = $data;
    }
    return $ret;
}

function homeHandler(mysqli $conn, $query, $body)
{
    $posts= getAllEntities($conn,'posts');
    $categories= getAllEntities($conn,'categories');

    require 'index.phtml';
}

function getAllPostsHandler(mysqli $conn, $query, $body)
{
    if(isset($query['category'])){
        $category = $query['category'];
        $queryString = "SELECT * from posts where category= ? ORDER BY ID DESC";
        $statement = $conn->prepare($queryString);

        $statement->bind_param('i',$category);
        $statement->execute();

        $result = $statement->get_result();

        $posts= [];
        while($data = $result->fetch_assoc()){
            $posts[] = $data; 
        }
    }else{
        $posts= getAllEntities($conn,'posts');
    }

    $categories= getAllEntities($conn,'categories');

    require 'posts.phtml';

}

function singlePostHandler(mysqli $conn, $query, $response)
{
    $categories= getAllEntities($conn,'categories');

    $queryString = "SELECT * FROM posts WHERE id=?";
    $statement = $conn->prepare($queryString);

    $id = $query['id'];

    $statement->bind_param('s',$id);
    $statement->execute();

    $post = $statement->get_result()->fetch_assoc();
    
    require 'post.phtml';

}

function adminHandler(mysqli $conn, $query, $body)
{

    $result = $conn->query("SELECT posts.*,categories.name from posts
            INNER JOIN categories
            ON posts.category = categories.id
            ORDER BY posts.title");

    $posts = [];
    
    while ($data = $result->fetch_assoc()) {
        $posts[] = $data;
    }
       
    $result2 = $conn->query("SELECT * from categories ORDER by name");

    $categories = [];
    
    while ($data = $result2->fetch_assoc()) {
        $categories[] = $data;
    }


    require 'admin.phtml';
}


function addPostHandler(mysqli $conn, $query, $body)
{
    $categories= getAllEntities($conn,'categories');

    require 'add_post.phtml';
}

function createPostHandler(mysqli $conn, $query, $body)
{
        $title = $body['title'];
        $text = $body['text'];
        $category = $body['category'];
        $author = $body['author'];
        $tags = $body['tags'];
      
        if($title ==''|| $text == '' || $category == '' || $author == ''){
          //Set error
          $error = "Please fill out all required fields";
        }else{
          $query = "INSERT INTO `posts`( `category`, `title`, `body`, `author`, `tags`)VALUES (?,?,?,?,?)";
          $stmt = $conn ->prepare($query);
        $stmt->bind_param('issss',$category,$title,$text,$author,$tags);
        $isSuccess = $stmt->execute();
      
        if(!$isSuccess){
          echo 'No insert';
        }
        header('Location:/dashboard');

        }

}

function addCategoryHandler(mysqli $conn, $query, $body)
{
    require 'add_category.phtml';
}

function creatCategoryHandler(mysqli $conn, $query, $body)
{
 
   $name = $body['name'];
 
   if($name ==''){
     //Set error
     $error = "Please fill out all required fields";
   }else{
     $query = "INSERT INTO `categories`(`name`) VALUES (?)";
     $stmt = $conn ->prepare($query);
   $stmt->bind_param('s',$name);
   $isSuccess = $stmt->execute();
 
   if(!$isSuccess){
     echo 'No insert';
   }
   header('Location:/dashboard');
 
   }

}

function editPostHandler(mysqli $conn, $query, $body)
{
    $categories= getAllEntities($conn,'categories');

    $id = $query['id'];
    $queryString = "SELECT * from posts WHERE id = ?";
    $statement = $conn->prepare($queryString);

    $statement->bind_param('s', $id);
    $statement->execute();

    $post = $statement->get_result()->fetch_assoc();

    require 'edit_post.phtml';
}

function updatePostHandler(mysqli $conn, $query, $body)
{
    $title = $body['title'];
    $text = $body['text'];
    $category = $body['category'];
    $author = $body['author'];
    $tags = $body['tags'];
    $id = $query['id'];
      
    if($title ==''|| $text == '' || $category == '' || $author == ''){
        //Set error
        $error = "Please fill out all required fields";
    }else{ 
        $queryString = "UPDATE `posts` SET `category`= ?,`title`= ?,`body`= ? ,`author`= ?,`tags`= ? WHERE `id` = ?";
        $stmt = $conn ->prepare($queryString);
        $stmt->bind_param('isssss',$category,$title,$text,$author,$tags,$id);
        $isSuccess = $stmt->execute();
      
        if(!$isSuccess){
          echo 'No update';
        }
      
        header("Location:/dashboard?msg=".urlencode('Record Updated'));
    }    

}

function deletePostHandler(mysqli $conn, $query, $body)
{       
    $id = $query['id'];
    $queryString = "DELETE FROM posts WHERE id = ?";
    $stmt = $conn ->prepare($queryString);
    $stmt->bind_param('s',$id);
    $isSuccess = $stmt->execute();
      
    if(!$isSuccess){
        echo 'No delete';
    }
      
    header("Location:/dashboard?msg=".urlencode('Record Deleted'));
}

function editCategoryHandler(mysqli $conn, $query, $body)
{
    $id = $query['id'];
    $queryString = "SELECT * from categories WHERE id = ?";
    $statement = $conn->prepare($queryString);

    $statement->bind_param('s', $id);
    $statement->execute();

    $category = $statement->get_result()->fetch_assoc();

    require 'edit_category.phtml';

}

function updateCategoryHandler(mysqli $conn, $query, $body)
{
    $name = $body['name'];
    $id = $query['id'];

    if($name ==''){
        //Set error
        $error = "Please fill out all required fields";
    }else{
        $queryString = "UPDATE `categories` SET `name`= ? WHERE `id` = ?";
        $stmt = $conn ->prepare($queryString);
        $stmt->bind_param('ss',$name,$id);
        $isSuccess = $stmt->execute();

    if(!$isSuccess){
        echo 'No update';
    }

    header("Location:/dashboard?msg=".urlencode('Record Updated'));
    }

}

function deleteCategoryHandler(mysqli $conn, $query, $body)
{
    $id = $query['id'];

    $queryString = "DELETE FROM categories WHERE id = ?";
    $stmt = $conn ->prepare($queryString);
    $stmt->bind_param('s',$id);
    $isSuccess = $stmt->execute();

    if(!$isSuccess){
        echo 'No delete';
    }

    header("Location:/dashboard?msg=".urlencode('Record Deleted'));

}