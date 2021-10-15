let card2 = document.getElementById('card-2');
let card1 = document.getElementById('card-1');
let commenter_name1 = document.getElementById('commenter-name1');
let commenter_name2 = document.getElementById('commenter-name2');

card2.addEventListener('mouseover',function() {
    card2.classList.add('bg-info');
    card2.classList.add('text-white');
    commenter_name2.classList.remove('text-danger');
    commenter_name2.classList.add('text-primary');
});
card2.addEventListener('mouseout',function() {
    card2.classList.remove('bg-info');
    card2.classList.remove('text-white');
    commenter_name2.classList.add('text-danger');
    commenter_name2.classList.remove('text-primary');
});
card1.addEventListener('mouseover',function() {
    card1.classList.add('bg-danger');
    card1.classList.add('text-white');
    commenter_name1.classList.remove('text-info');
    commenter_name1.classList.add('text-primary');
});
card1.addEventListener('mouseout',function() {
    card1.classList.remove('bg-danger');
    card1.classList.remove('text-white');
    commenter_name1.classList.add('text-info');
    commenter_name1.classList.remove('text-primary');
});
