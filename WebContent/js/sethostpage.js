/**
 * ������ҳ���ղر�վ��javaScript����
 */
// ��Ϊ��ҳ www.52laojia.cn
function SetHome(obj,url){
    try{
        obj.style.behavior='url(#default#homepage)';
       obj.setHomePage(url);
   }catch(e){
       if(window.netscape){
          try{
              netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
         }catch(e){
              alert("��Ǹ���˲�����������ܾ���\n\n�����������ַ�����롰about:config�����س�Ȼ��[signed.applets.codebase_principal_support]����Ϊ'true'");
          }
       }else{
        alert("��Ǹ������ʹ�õ�������޷���ɴ˲�����\n\n����Ҫ�ֶ�����"+url+"������Ϊ��ҳ��");
       }
  }
}

// �ղر�վ www.52laojia.cn

function AddFavorite(title, url) {
  try {
      window.external.addFavorite(url, title);
  }
catch (e) {
     try {
       window.sidebar.addPanel(title, url, "");
    }
     catch (e) {
         alert("��Ǹ������ʹ�õ�������޷���ɴ˲�����\n\n�����ղ�ʧ�ܣ���ʹ��Ctrl+D�������");
     }
  }
}
