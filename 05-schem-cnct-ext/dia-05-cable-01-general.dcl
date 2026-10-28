///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_05_cable_01_general: dialog {label = "Кабели и Провода";

:row {label="";
  :column {label="";
  	:text {label="Тип кабеля";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=30; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Марка";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=24; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Число жил х"; key="hm-31";}
    :text {label="Диаметр"; key="hm-32";}
    :text {label="жилы, мм"; key="hm-33";}
    :list_box {key="txt-03"; list=""; width=16; height=20; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Наружний"; key="hm-41";}
    :text {label="диаметр,"; key="hm-42";}
    :text {label="мм"; key="hm-43";}
    :list_box {key="txt-04"; list=""; width=12; height=20; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Описание";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-900"; list=""; width=45; height=20;}//list_box
  }//column
}//row

:row {label="";
	:button {label="Рисовать"; key="but-1"; height=1;}
	ok_only;
}//row
}
