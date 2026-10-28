///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_exec_mech_meo_40: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=25; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Крутящий";}
    :text {label="момент,";}
    :text {label="Нм";}
    :list_box {key="txt-02"; list=""; width=10; height=10; value=0;}
  }//column
  
  :column {label="";
    :text {label="Время";}
    :text {label="полного";}
    :text {label="хода, с";}
    :list_box {key="txt-03"; list=""; width=10; height=10; value=0;}
  }//column
  
  :column {label="";
    :text {label="Значение";}
    :text {label="полного";}
    :text {label="хода, r";}
    :list_box {key="txt-04"; list=""; width=10; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Сигн.";}
    :text {label="положения";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Эл. питание";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=15; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Исп. для";}
    :text {label="АЭС";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=10; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Ограничитель";}
    :text {label="наибольшего";}
    :text {label="момента";}
    :list_box {key="txt-08"; list=""; width=10; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Климатич.";}
    :text {label="исполнение";}
    :text {label="момента";}
    :list_box {key="txt-09"; list=""; width=18; height=10; value=0;}
  }//column

  :column {label="";
    :text {label="Потр.";}
    :text {label="мощность,";}
    :text {label="кВт";}
    :list_box {key="txt-10"; list=""; width=10; height=10; value=0;}
  }//column  

  :column {label="";
    :text {label="Ток";}
    :text {label="номин,";}
    :text {label="А";}
    :list_box {key="txt-11"; list=""; width=10; height=10; value=0;}
  }//column 

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}
    :list_box {key="txt-99"; list=""; width=10; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-071"; value="";}
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
