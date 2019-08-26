/**
 * 得到Radio组的值
 * @param name
 * @returns {*}
 */
function getRadio(name) {
    var radio=document.getElementsByName(name);
    for (i=0;i<radio.length;i++){       //遍历Radio
        if(radio[i].checked)
        {
            return radio[i].value

        }
    }
}

/**
 * 在某个节点后添加代码
 * @param elementld
 * @param child
 */
function add(elementld,child) {
    var rowTr = document.getElementById(elementld);
    //找到html的tr节点
    rowTr.className = elementld;
    rowTr.innerHTML = child
}