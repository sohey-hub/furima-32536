window.addEventListener('load', function(){

   // 選択した画像を表示する関数
   const createImageHTML = (blob) => {
    // 画像を表示するためのdiv要素を生成
   const imageElement = document.createElement('div');

   // 表示する画像を生成
   const blobImage = document.createElement('img');
   blobImage.setAttribute('src', blob);
   // 生成したHTMLの要素をブラウザに表示させる
   imageElement.appendChild(blobImage);
   ImageList.appendChild(imageElement);
 };

  document.getElementById('item-image').addEventListener('change', function(){
    console.log(123);
  });
});