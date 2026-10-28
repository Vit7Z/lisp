///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_trnst_17378: dialog {label = "Переходы";

:row {label="";
  :column {label="";
    :text {label="Исполнение";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; height=20;}//list_box
  }//column  
      
  :column {label="";
    :text {label="Условный";}
    :text {label="проход";}
    :text {label="DN";}
    :list_box {key="txt-02"; list=""; height=20;}//list_box
  }//column  

  :column {label="";
  	:text {label="Наружный";}
    :text {label="диаметр";}
    :text {label="D";}
    :list_box {key="txt-03"; list=""; height=20;}//list_box
  }//column

  :column {label="";
    :text {label="Толщина";}
    :text {label="стенки";}
    :text {label="T";}
    :list_box {key="txt-04"; list=""; height=20;}//list_box
  }//column

  :column {label="";
    :text {label="Наружный";}
    :text {label="диаметр";}
    :text {label="D1";}
    :list_box {key="txt-05"; list=""; height=20;}//list_box
  }//column
  
  :column {label="";
    :text {label="Толщина";}
    :text {label="стенки";}
    :text {label="T1";}
    :list_box {key="txt-06"; list=""; height=20;}//list_box
  }//column

  :column {label="";
    :text {label="Длина";}
    :text {label="перехода";}
    :text {label="L";}
    :list_box {key="txt-07"; list=""; height=20;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; height=20;}//list_box
  }//column
  
  :column {label="";
		:text {label="Выбрано"; }//text
		:text {label=""; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-901"; list=""; width=54; height=20; value= "0";}
	}//column  
}//row

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
