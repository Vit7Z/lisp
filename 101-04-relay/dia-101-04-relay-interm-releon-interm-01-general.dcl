///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_relay_finder: dialog {label = "Реле Finder и аксессуары к ним";

:row {label="";

  :column {
    :text {label="Тип изделия";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=10;}//list_box
  }//column  

  :column {
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=16; height=10;}//list_box
  }//column

  :column {
    :text {label="Кол. и тип"; key="mln-31";}
    :text {label="контактов"; key="mln-32";}
    :list_box {key="txt-03"; list=""; width=14; height=10;}//list_box
  }//column

  :column {
    :text {label="Uупр.,"; key="mln-41";}
    :text {label="В"; key="mln-42";}
    :list_box {key="txt-04"; list=""; width=10; height=10;}//list_box
  }//column 

  :column {
    :text {label="Iном.,"; key="mln-51";}
    :text {label="А"; key="mln-52";}
    :list_box {key="txt-05"; list=""; width=8; height=10;}//list_box
  }//column
  
  :column {
    :text {label="Масса,"; key="mln-61";}
    :text {label="кг"; key="mln-62";}
    :list_box {key="txt-06"; list=""; width=10; height=10;}//list_box
  }//column
}//row

:row {label="";
  :column {label="";
  	:text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=50; height=5; value= "0";}
  }//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value="0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row
}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
