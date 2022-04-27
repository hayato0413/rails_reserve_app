


const img = document.getElementById('user_img');

 function clickListener (e) {
  
    const menu = document.getElementById("hide_menu")
    if (menu.style.display == "block") {
      menu.style.display = "none";
    } else {
      menu.style.display = "block";
    } 
}


img.addEventListener('click', clickListener);

