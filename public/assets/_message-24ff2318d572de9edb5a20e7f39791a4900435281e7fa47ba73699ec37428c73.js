// settings関数で初期設定 全体に適応させたい場合
iziToast.settings({
  timeout: 3000, // default timeout
  resetOnHover: true,
  // icon: '', // icon class
  transitionIn: 'flipInX',
  transitionOut: 'flipOutX',
  position: 'topRight', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter, center
  onOpen: function () {
    console.log('callback abriu!');
  },
  onClose: function () {
    console.log("callback fechou!");
  }
});


// info
$('#infoClick').click(function () {
  iziToast.info({position: "center", title: 'Hello', message: 'iziToast.info()'});
}); // ! click

// success
$('#successClick').click(function () {
  iziToast.success({timeout: 5000, icon: 'fa fa-chrome', title: 'OK', message: 'iziToast.sucess() with custom icon!'});
}); // ! .click

// warning
$('#warningClick').click(function () {
  iziToast.warning({position: "bottomLeft", title: 'Caution', message: '日本語環境のテスト'});
});

// error
$('#errorClick').click(function () {
  iziToast.error({title: 'Error', message: 'Incorrect Password'});
});

// custom toast
$('#customClick').click(function () {

  iziToast.show({
    color: 'dark',
    icon: 'fa fa-user',
    title: 'Hey',
    message: 'Custom Toast!',
    position: 'center', // bottomRight, bottomLeft, topRight, topLeft, topCenter, bottomCenter
    progressBarColor: 'rgb(0, 255, 184)',
    buttons: [
      [
        '<button>Ok</button>',
        function (instance, toast) {
          alert("Hello world!");
        }
      ],
      [
        '<button>Close</button>',
        function (instance, toast) {
          instance.hide({
            transitionOut: 'fadeOutUp'
          }, toast);
        }
      ]
    ]
  });

}); // ! .click()

$('#any').click(function(){
iziToast.error({
title: 'Errorカラー',
message: 'iziToast.error()'
});
});
