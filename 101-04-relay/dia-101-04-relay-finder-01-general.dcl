///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_relay_finder: dialog {label = "Реле Finder и аксессуары к ним";

:row {label="";

  :column {
    :text {label="Тип изделия";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=22; height=10;}//list_box
  }//column  

  :column {
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=18; height=10;}//list_box
  }//column

  :column {
    :text {label="Тип"; key="mln-31";}
    :text {label="контакта"; key="mln-32";}
    :list_box {key="txt-03"; list=""; width=20; height=10;}//list_box
  }//column

  :column {
    :text {label="Кол."; key="mln-41";}
    :text {label="контактов"; key="mln-42";}
    :list_box {key="txt-04"; list=""; width=10; height=10;}//list_box
  }//column 

  :column {
    :text {label="Тип"; key="mln-51";}
    :text {label="катушки"; key="mln-52";}
    :list_box {key="txt-05"; list=""; width=15; height=10;}//list_box
  }//column

  :column {
    :text {label="Uкатушки,"; key="mln-61";}
    :text {label="В"; key="mln-62";}
    :list_box {key="txt-06"; list=""; width=10; height=10;}//list_box
  }//column
  
  :column {
    :text {label="Материал"; key="mln-71";}
    :text {label="контактов"; key="mln-72";}
    :list_box {key="txt-07"; list=""; width=10; height=10;}//list_box
  }//column

  :column {
    :text {label="Схема"; key="mln-81";}
    :text {label="контакта"; key="mln-82";}
    :list_box {key="txt-08"; list=""; width=10; height=10;}//list_box
  }//column    

  :column {
    :text {label="Опции"; key="mln-91";}
    :text {label=""; key="mln-92";}
    :list_box {key="txt-09"; list=""; width=22; height=10;}//list_box
  }//column

  :column {
    :text {label="Варианты"; key="mln-101";}
    :text {label=""; key="mln-102";}
    :list_box {key="txt-10"; list=""; width=15; height=10;}//list_box
  }//column

  :column {
    :text {label="Монтаж"; key="mln-111";}
    :text {label=""; key="mln-112";}
    :list_box {key="txt-11"; list=""; width=20; height=10;}//list_box
  }//column

  :column {
    :text {label="Масса,"; key="mln-121";}
    :text {label="кг"; key="mln-122";}
    :list_box {key="txt-12"; list=""; width=8; height=10;}//list_box
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
