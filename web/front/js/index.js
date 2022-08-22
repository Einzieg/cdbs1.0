
$(function () {
    var count = 0;
    var countPrice = 0;
    var index;
    $("td").on("click", function () {
        var className = this.className;
        index= $("td").index(this);
        var bian = "p0" + index;
        if (count < 5 && className !== "p0" && className !== "p60") {
            count++;
            $(this).addClass("p0");
            console.log(index);
            $(".sit").html(count);
            console.log(className === "p0");
            //动态显示座位
            //获取十位上的数字
            var b = parseInt((index % 100) / 10) + 1;
            //获取个位上的数字
            var a = parseInt(index % 10) + 1;
            if (index >= 100 && index <= 107) {
                b = 11;
                a = a + 1;
            } else if (index >= 108 && index < 110) {
                b = 12;
                a = a - 6;
            } else if (index >= 110) {
                b = 12;
                a = a + 4;
            }
            console.log("b:" + b);
            console.log("a:" + a);
            bian = $('<button class="btn" id="' + bian + '">' + b + '行' + a + '列</button>');
            $(".zw").before(bian);

        } else if (count <= 5 && className === "p0" && className !== "p60") {
            count--;
            $(this).removeClass("p0");
            $(".sit").html(count);
            $("#" + bian).remove();
        } else if (className === "p60") {
            return false;
        } else {
            alert("您做多只能买五张票！");
        }
        countPrice = count * $("#WIDtotal_amount").val();
        $(".countPrice").html("&yen;" + countPrice + ".00");

        //提交
        var that = this;
        $(".btnSub").on("click", function () {
            if (that.className === "p0") {
                $(that).removeClass("p0");
                $(that).addClass("p60");
                count = 0;
                countPrice = 0;
                $(".sit").html(count);
                countPrice = count * $("#WIDtotal_amount").val();
                $(".countPrice").html("&yen;" + countPrice + ".00");
                $(".btn").remove();


            }
        });
    })
})