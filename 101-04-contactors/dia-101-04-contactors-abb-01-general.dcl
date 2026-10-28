///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_contactors_abb: dialog {label = "ABB";

:row {label="";
  :column {label="";
    :text {label="Модель, тип";}
    :text {label="оборудования";}
    :list_box {key="txt-01"; list=""; width=20; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Тип";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}
  }//column
  
  :column {label="";
    :text {label="Код";}
    :text {label="заказа";}
    :list_box {key="txt-03"; list=""; width=20; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Pном, кВт"; key="ptxt-41";}
    :text {label="AC-3, 400В"; key="ptxt-42";}
    :list_box {key="txt-04"; list=""; width=16; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Iном, А"; key="ptxt-51";}
    :text {label="AC-3, 400В"; key="ptxt-52";}
    :list_box {key="txt-05"; list=""; width=16; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Тип"; key="ptxt-61";}
    :text {label="соединения"; key="ptxt-62";}
    :list_box {key="txt-06"; list=""; width=20; height=10; value=0;}
  }//column
 
  :column {label="";
    :text {label="Доп."; key="ptxt-71";}
    :text {label="контакты"; key="ptxt-72";}
    :list_box {key="txt-07"; list=""; width=13; height=10; value=0;}
  }//column  
  
  :column {label="";
    :text {label="Uупр."; key="ptxt-81";}
    :text {label=""; key="ptxt-82";}
    :list_box {key="txt-08"; list=""; width=25; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Кол."; key="ptxt-91";}
    :text {label="полюсов"; key="ptxt-92";}
    :list_box {key="txt-09"; list=""; width=10; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,"; key="ptxt-101";}
    :text {label="кг"; key="ptxt-102";}
    :list_box {key="txt-10"; list=""; width=10; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:list_box {key="txt-900"; list=""; height=6; value=0;}//list_box
	}//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
	}//column
}//row

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