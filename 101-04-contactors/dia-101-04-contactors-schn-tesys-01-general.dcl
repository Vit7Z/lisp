///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_contactors_tesys: dialog {label = "Schneider Electric, серия \"TeSys\"";

:row {label="";
  :column {label="";
    :text {label="Модель, тип";}
    :text {label="оборудования";}
    :list_box {key="txt-00"; list=""; width=20; height=15; value=0;}
  }//column
  
  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0; multiple_select=true;}
  }//column

  :column {label="";
    :text {label="Iном, А"; key="ptxt-021";}
    :text {label="AC-3, 440В"; key="ptxt-022";}
    :list_box {key="txt-02"; list=""; width=20; height=15; value=0; multiple_select=true;}
  }//column

  :column {label="";
    :text {label="Тип"; key="ptxt-031";}
    :text {label="соединения"; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=20; height=15; value=0; multiple_select=true;}
  }//column
 
  :column {label="";
    :text {label="Доп."; key="ptxt-041";}
    :text {label="контакты"; key="ptxt-042";}
    :list_box {key="txt-04"; list=""; width=20; height=15; value=0; multiple_select=true;}
  }//column  
  
  :column {label="";
    :text {label="Упр."; key="ptxt-051";}
    :text {label="напряжение"; key="ptxt-052";}
    :list_box {key="txt-05"; list=""; width=20; height=15; value=0;}
  }//column

  :column {label="";
    :text {label="Кол."; key="ptxt-061";}
    :text {label="полюсов"; key="ptxt-062";}
    :list_box {key="txt-06"; list=""; width=20; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-071"; value="Контакторы общего назначения.";}
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