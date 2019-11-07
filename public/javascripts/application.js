console.log('hi')
var lists = document.querySelectorAll('li')
var cataloge = document.querySelectorAll('.li_cataloge')
var keywords = document.querySelectorAll('.li_keywords')
var partsNum = document.querySelectorAll('.li_parts_num')
var formCataloge = document.querySelector('.cataloge')
var formKeywords = document.querySelector('.keywords')
var formPartsNum = document.querySelector('.parts_num')



var clicked = function(event){
  if (event.target.classList[0] === 'li_cataloge') {
    console.log('hiC')
    formCataloge.classList.remove('deactive')
    formCataloge.classList.add('active')
    formKeywords.classList.remove('active')
    formPartsNum.classList.remove('active')
    formKeywords.classList.add('deactive')
    formPartsNum.classList.add('deactive')
  } else if (event.target.classList[0] === 'li_keywords') {
    console.log('hiK')
    formKeywords.classList.remove('deactive')
    formKeywords.classList.add('active')
    formCataloge.classList.remove('active')
    formPartsNum.classList.remove('active')
    formCataloge.classList.add('deactive')
    formPartsNum.classList.add('deactive')
  } else {
    console.log('hiP')
    formPartsNum.classList.remove('deactive')
    formPartsNum.classList.add('active')
    formCataloge.classList.remove('active')
    formKeywords.classList.remove('active')
    formCataloge.classList.add('deactive')
    formKeywords.classList.add('deactive')
  }

}







//   if (event.target.classList[1] !== 'ticked'&& gameInfo.textContent !== 'Winner!') {
//     clickCounter++
//     if (timeEclipse < 21 || timeEclipse === 'Time Over') {
//       timerStop()
//       timeEclipse = 21
//       timerStart()
//     } else {
//       timeEclipse = 21
//       timerStart()
//     }
//     event.target.classList.remove('player1-tricked')
//     if(clickCounter % 2 === 1) {
//       event.target.classList.add('ticked')
//       var doTrickNow = Math.round(Math.random()*5)
//       if (trickYetToPlayer1 && doTrickNow === 1) {
//         trickYetToPlayer1 = false
//         event.target.textContent = 'O'
//         event.target.classList.add('player1-tricked')
//         winningChecker('O')
//         gameInfo.textContent = "Oh! it's my mistake! Sorry Player1."
//       } else {
//         event.target.textContent = 'X' 
//         gameInfo.textContent = 'Play2, your turn'
//         player2Turn.classList.add('active')
//         player2Hand.classList.add('active')
//         player1Turn.classList.remove('active')
//         player1Hand.classList.remove('active')
//         winningChecker('X')
//       }
//     } else {
//       event.target.classList.add('ticked')
//       event.target.textContent = 'O'
//       gameInfo.textContent = 'Play1, your turn'
//       player1Turn.classList.add('active')
//       player1Hand.classList.add('active')
//       player2Turn.classList.remove('active')
//       player2Hand.classList.remove('active')
//       winningChecker('O')
//     }
//   } else {
//     clickCounter+=0
//   }  
// }




var clickMonitor = function(clicking) {
  clicking.addEventListener('click',clicked)
}



lists.forEach(clickMonitor)