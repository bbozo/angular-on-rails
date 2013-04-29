Blang.factory "Post", ($resource) -> $resource "/posts/:id", id: "@id"

Blang.controller "PostCtrl", ($scope, Post) ->
  $scope.post = new Post()
  $scope.posts = Post.query()

  $scope.add = ->
    $scope.posts.push Post.save title: $scope.post.title, body: $scope.post.body
    $scope.post = new Post()

  $scope.delete = ($index) ->
    if confirm("Are you sure you want to delete this post?")
      $scope.posts[$index].$delete()
      $scope.posts.splice($index, 1)
