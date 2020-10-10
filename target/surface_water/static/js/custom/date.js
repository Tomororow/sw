layui.use('laydate', function(){
  var laydate = layui.laydate;
  
  //�����÷�
  laydate.render({
    elem: '#test1'
  });
  
  //���ʰ�
  laydate.render({
    elem: '#test1-1'
    ,lang: 'en'
  });
  
  //��ѡ����
  laydate.render({
    elem: '#test2'
    ,type: 'year'
  });
  
  //����ѡ����
  laydate.render({
    elem: '#test3'
    ,type: 'month'
  });
  
  //ʱ��ѡ����
  laydate.render({
    elem: '#test4'
    ,type: 'time'
  });
  
  //ʱ��ѡ����
  laydate.render({
    elem: '#test5'
    ,type: 'datetime'
  });
  
  //���ڷ�Χ
  laydate.render({
    elem: '#test6'
    ,range: true
  });
  
  //�귶Χ
  laydate.render({
    elem: '#test7'
    ,type: 'year'
    ,range: true
  });
  
  //���·�Χ
  laydate.render({
    elem: '#test8'
    ,type: 'month'
    ,range: true
  });
  
  //ʱ�䷶Χ
  laydate.render({
    elem: '#test9'
    ,type: 'time'
    ,range: true
  });
  
  //����ʱ�䷶Χ
  laydate.render({
    elem: '#test10'
    ,type: 'datetime'
    ,range: true
  });
  
  //�Զ����ʽ
  laydate.render({
    elem: '#test11'
    ,format: 'yyyy��MM��dd��'
  });
  laydate.render({
    elem: '#test12'
    ,format: 'dd/MM/yyyy'
  });
  laydate.render({
    elem: '#test13'
    ,format: 'yyyyMMdd'
  });
  laydate.render({
    elem: '#test14'
    ,type: 'time'
    ,format: 'H��m��'
  });
  laydate.render({
    elem: '#test15'
    ,type: 'month'
    ,range: '~'
    ,format: 'yyyy-MM'
  });
  laydate.render({
    elem: '#test16'
    ,type: 'datetime'
    ,range: '��'
    ,format: 'yyyy��M��d��Hʱm��s��'
  });
  
  //������������
  laydate.render({
    elem: '#test17'
    ,calendar: true
  });
  
  //�Զ�����Ҫ��
  laydate.render({
    elem: '#test18'
    ,mark: {
      '0-10-14': '����'
      ,'0-12-31': '����' //ÿ�������
      ,'0-0-10': '����' //ÿ��ĳ��
      ,'0-0-15': '����'
      ,'2017-8-15': '' //���Ϊ���ַ�����Ĭ����ʾ����+����
      ,'2099-10-14': '�Ǻ�'
    }
    ,done: function(value, date){
      if(date.year === 2017 && date.month === 8 && date.date === 15){ //���2017��8��15�գ�������ʾ��
        layer.msg('��һ���ǣ��й�������ս��ʤ��72����');
      }
    }
  });
  
  //�޶���ѡ����
  var ins22 = laydate.render({
    elem: '#test-limit1'
    ,min: '2016-10-14'
    ,max: '2080-10-14'
    ,ready: function(){
      ins22.hint('���ڿ�ѡֵ�趨�� <br> 2016-10-14 �� 2080-10-14');
    }
  });
  
  //ǰ���������ѡ��������7��Ϊ��
  laydate.render({
    elem: '#test-limit2'
    ,min: -7
    ,max: 7
  });
  
  //�޶���ѡʱ��
  laydate.render({
    elem: '#test-limit3'
    ,type: 'time'
    ,min: '09:30:00'
    ,max: '17:30:00'
    ,btns: ['clear', 'confirm']
  });
  
  //ͬʱ�󶨶��
  lay('.test-item').each(function(){
    laydate.render({
      elem: this
      ,trigger: 'click'
    });
  });
  
  //��ʼ��ֵ
  laydate.render({
    elem: '#test19'
    ,value: '1989-10-14'
  });
  
  //ѡ�к�Ļص�
  laydate.render({
    elem: '#test20'
    ,done: function(value, date){
      layer.alert('��ѡ��������ǣ�' + value + '<br>��õĶ�����' + JSON.stringify(date));
    }
  });
  
  //�����л��Ļص�
  laydate.render({
    elem: '#test21'
    ,change: function(value, date){
      layer.msg('��ѡ��������ǣ�' + value + '<br><br>��õĶ�����' + JSON.stringify(date));
    }
  });
  //�����ֵײ���
  laydate.render({
    elem: '#test22'
    ,showBottom: false
  });
  
  //ֻ����ȷ����ť
  laydate.render({
    elem: '#test23'
    ,btns: ['confirm']
  });
  
  //�Զ����¼�
  laydate.render({
    elem: '#test24'
    ,trigger: 'mousedown'
  });
  
  //���Ҵ���
  laydate.render({
    elem: '#test25'
    ,eventElem: '#test25-1'
    ,trigger: 'click'
  });
  
  //˫���Ҵ���
  lay('#test26-1').on('dblclick', function(){
    laydate.render({
      elem: '#test26'
      ,show: true
      ,closeStop: '#test26-1'
    });
  });
  
  //����ֻ��
  laydate.render({
    elem: '#test27'
    ,trigger: 'click'
  });
  
  //��inputԪ��
  laydate.render({
    elem: '#test28'
  });
  
  //ī������
  laydate.render({
    elem: '#test29'
    ,theme: 'molv'
  });
  
  //�Զ�����ɫ
  laydate.render({
    elem: '#test30'
    ,theme: '#393D49'
  });
  
  //��������
  laydate.render({
    elem: '#test31'
    ,theme: 'grid'
  });
  
  
  //ֱ��Ƕ����ʾ
  laydate.render({
    elem: '#test-n1'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n2'
    ,position: 'static'
    ,lang: 'en'
  });
  laydate.render({
    elem: '#test-n3'
    ,type: 'month'
    ,position: 'static'
  });
  laydate.render({
    elem: '#test-n4'
    ,type: 'time'
    ,position: 'static'
  });
});