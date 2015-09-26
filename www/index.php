<!DOCTYPE html>
<html>
<head>
  <link rel="stylesheet" type="text/css" href="style.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>

  <script>

    $(document).ready(function(){
      $("#about_link").click(function(){
        $("#dynamic_content").load("about.php");
        return false;
      });
      $("#projects_link").click(function(){
        $("#dynamic_content").load("projects.php");
        return false;
      });
      $("#resume_link").click(function(){
        $("#dynamic_content").load("resume.php");
        return false;
      });
      $("#contact_link").click(function(){
        $("#dynamic_content").load("contact.php");
        return false;
      });
    });
  </script>

</head>

<body>

<div id="content_header">
  <div class="content_frame">
    <div id="main_title_div"> 
      Jamal Deemer
    </div>
    <div id="main_nav_div">
      <a id="about_link" href="">About</a>
      <a id="projects_link" href="">Projects</a>
      <a id="resume_link" href="">Resume</a>
      <a id="contact_link" href="">Contact</a>
    </div>
  </div>
</div>
<div id="content_body">
  <div class="content_frame">
    <div id="dynamic_content"></div>
  </div>
</div>


</body>
</html>
