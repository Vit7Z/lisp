///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_iek_cable_tip: dialog {label = "Наконечники IEK";

:row {label="";
  :column {label="";
    :text {label="Наименование";}
    :text {label="";}
    :text {label=""; }//text
    :list_box {key="txt-00"; list=""; width=25; height=20; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=20; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Сечение";}
    :text {label="провода,";}
    :text {label="мм2";}
    :list_box {key="txt-03"; list=""; width=10; height=20; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Цвет";}
    :text {label="изоляции";}
    :text {label="";}//text
    :list_box {key="txt-04"; list=""; width=20; height=20; value=0;}//list_box
  }//column  
  
  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}//text
    :list_box {key="txt-99"; list=""; width=5; height=20; value=0;}//list_box
  }//column
}//row

:row {
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-1001"; list=""; width=5; height=3; value=0;}//list_box
  }//column
}//column

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
