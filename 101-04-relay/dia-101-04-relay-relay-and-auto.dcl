///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_relay_relay_and_auto: dialog {label = "";

:row {label="";  
  :column {label="";
    :text {label="Модель"; key="ptxt-011";}
    :text {label=""; key="ptxt-012";}
    :text {label=""; key="ptxt-013";}//text
    :list_box {key="txt-01"; list=""; width=20; height=17; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Сочетание"; key="ptxt-021";}
    :text {label="контактов"; key="ptxt-022";}
    :text {label=""; key="ptxt-023";}//text
    :list_box {key="txt-02"; list=""; width=20; height=17; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Напряжение,"; key="ptxt-031";}
    :text {label="В"; key="ptxt-032";}
    :text {label=""; key="ptxt-033";}//text
    :list_box {key="txt-03"; list=""; width=20; height=17; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Розетка"; key="ptxt-041";}
    :text {label=""; key="ptxt-042";}
    :text {label="";  key="ptxt-043";}//text
    :list_box {key="txt-04"; list=""; width=70; height=17; value=0;}//list_box
  }//column
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
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
