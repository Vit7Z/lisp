///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_auto_switch_se: dialog {label = "Электроаппараты Schneider Electric";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-00"; list=""; width=38; height=15; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Тип"; key="ptxt-011";}
    :text {label="соединения"; key="ptxt-012";}
    :text {label=""; key="ptxt-013";}//text
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Кол., тип кон-"; key="ptxt-021";}
    :text {label="тактов"; key="ptxt-022";}
    :text {label=""; key="ptxt-023";}//text
    :list_box {key="txt-02"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул"; key="ptxt-031";}
    :text {label=""; key="ptxt-032";}
    :text {label=""; key="ptxt-033";}//text
    :list_box {key="txt-03"; list=""; width=20; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label=""; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :text {label="";  key="ptxt-043";}//text
    :list_box {key="txt-04"; list=""; width=20; height=15; value=0; multiple_select=true;}//list_box
  }//column  
  
  :column {label="";
    :text {label=""; key="ptxt-051";}
    :text {label=""; key="ptxt-052";}
    :text {label="";  key="ptxt-053";}//text
    :list_box {key="txt-05"; list=""; width=20; height=15; value=0; is_enabled=false; multiple_select=true;}//list_box
  }//column

  :column {label="";
    :text {label=""; key="ptxt-061";}
    :text {label=""; key="ptxt-062";}
    :text {label="";  key="ptxt-063";}//text
    :list_box {key="txt-06"; list=""; width=20; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-071"; value="Для контакторов типа LC1, LC2, LC7, LC8, LP1, трех- или  четырехполюсных.";}
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
