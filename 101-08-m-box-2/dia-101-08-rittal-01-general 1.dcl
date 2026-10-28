///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_rittal: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-01"; list=""; width=40; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :text {label="";}//text
    :list_box {key="txt-02"; list=""; width=15; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Размеры,"; key="ptxt-31";}
    :text {label="ШxВ, мм"; key="ptxt-32";}
    :text {label=""; key="ptxt-33";}//text
    :list_box {key="txt-03"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Мощность"; key="ptxt-41";}
    :text {label="возд. потока,"; key="ptxt-42";}
    :text {label="м3/ч"; key="ptxt-43";}//text
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Uпотр.,"; key="ptxt-51";}
    :text {label="Потр. мощн."; key="ptxt-52";}
    :text {label="";  key="ptxt-53";}//text
    :list_box {key="txt-05"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Вес, кг"; key="ptxt-61";}
    :text {label=""; key="ptxt-62";}
    :text {label=""; key="ptxt-63";}
    :list_box {key="txt-06"; list=""; width=7; height=10; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Описание";}
		:list_box {key="txt-900"; list=""; height=5; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=40; height=10; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
