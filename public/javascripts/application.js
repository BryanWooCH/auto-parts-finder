console.log('hi')
var lists = document.querySelectorAll('li')
var catalogue = document.querySelectorAll('.li_catalogue')
var keywords = document.querySelectorAll('.li_keywords')
var partsNum = document.querySelectorAll('.li_parts_num')
var formCatalogue = document.querySelector('.catalogue')
var formKeywords = document.querySelector('.keywords')
var formPartsNum = document.querySelector('.parts_num')



var clicked = function(event){
  if (event.target.classList[0] === 'li_catalogue') {
    console.log('hiC')
    formCatalogue.classList.remove('deactive')
    formCatalogue.classList.add('active')
    formKeywords.classList.remove('active')
    formPartsNum.classList.remove('active')
    formKeywords.classList.add('deactive')
    formPartsNum.classList.add('deactive')
  } else if (event.target.classList[0] === 'li_keywords') {
    console.log('hiK')
    formKeywords.classList.remove('deactive')
    formKeywords.classList.add('active')
    formCatalogue.classList.remove('active')
    formPartsNum.classList.remove('active')
    formCatalogue.classList.add('deactive')
    formPartsNum.classList.add('deactive')
  } else {
    console.log('hiP')
    formPartsNum.classList.remove('deactive')
    formPartsNum.classList.add('active')
    formCatalogue.classList.remove('active')
    formKeywords.classList.remove('active')
    formCatalogue.classList.add('deactive')
    formKeywords.classList.add('deactive')
  }

}

var clickMonitor = function(clicking) {
  clicking.addEventListener('click',clicked)
}

lists.forEach(clickMonitor)
