defineClass('ViewController', {
            viewDidLoad: function() {
            self.setTitle("测试模块");
            require('UIView, UIColor');
            self.ORIGviewDidLoad();
            var redColor = UIColor.redColor();
            self.view().setBackgroundColor(redColor);
            },
            });
