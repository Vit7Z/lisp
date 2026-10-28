///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_cir_brk_tesys: dialog {label = "Schneider Electric Tesys";

:row {label="";
  :column {label="";
    :text {label="Тип";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-01"; list=""; width=25; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="№ по";}
    :text {label="каталогу";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Iном., А"; key="ptxt-31";}
    :text {label="Тепловой"; key="ptxt-32";}
    :text {label="расцепит."; key="ptxt-33";}
    :list_box {key="txt-03"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Уставка, А"; key="ptxt-41";}
    :text {label="Эл-магнитн."; key="ptxt-42";}
    :text {label="расц."; key="ptxt-43";}//text
    :list_box {key="txt-04"; list=""; width=20; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Pном., кВт"; key="ptxt-51";}
    :text {label="400В, АС-3"; key="ptxt-52";}
    :text {label="";  key="ptxt-53";}//text
    :list_box {key="txt-05"; list=""; width=20; height=15; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Тип контактов"; key="ptxt-61";}
    :text {label=""; key="ptxt-62";}
    :text {label="";  key="ptxt-63";}//text
    :list_box {key="txt-06"; list=""; width=20; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,"; key="ptxt-71";}
    :text {label="кг"; key="ptxt-72";}
    :text {label="";  key="ptxt-73";}//text
    :list_box {key="txt-07"; list=""; width=20; height=15; value=0;}//list_box
  }//column

}//row

:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=20; height=5;}//list_box
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
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
