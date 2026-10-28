///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_akron: dialog {label = "Акрон";

:row {label=""; 
	:column {label=""; 
  	:text {label="Наименование";}
    :text {label="среды";}
    :list_box {key="txt-00"; list=""; width=10; height=20; value=0;}//list_box
	}//column
    
  :column {label=""; children_fixed_width=true;
		:text {label="Параметры среды";}
		:text {label="Температура, C";}
		:row {label="";
    	:edit_box {label=""; key="txt-011"; list=""; width=3; height=1; value="+5";}
      :edit_box {label=""; key="txt-012"; list=""; width=3; height=1; value="+150";}
    }//row
    	
    :text {label="Давление, кгс/см2";}
    :edit_box {label=""; key="txt-02"; list=""; width=3; height=1; value="16";}
    	
    :text {label="Расход, м3\ч";}
		:row {label="";
    	:edit_box {label=""; key="txt-031"; list=""; height=1; value="***";}
    	:edit_box {label=""; key="txt-032"; list=""; width=3; height=1; value="***";}
    }//row
    :text {label=""; height=11;}
	}//column
    
  :column {label=""; 
  	:text {label="Диаметр трубо-";}
    :text {label="провода, мм.";}
    :list_box {label=""; key="txt-06"; list=""; width=16; height=20; value="0"; multiple_select=true;}
  }//column
  :column {label=""; 
  	:text {label="Пределы";}
    :text {label="измерений, м3/ч.";}
    :list_box {label=""; key="txt-07"; list=""; width=16; height=20; value="0"; multiple_select=true;}
  }//column    
    
  :column {label=""; 
 	
  	:text {label="Блок токового";}
    :text {label="сигнала";}
    :list_box {key="txt-04"; list=""; width=4; height=6; value=0;}//list_box
    
    :text {label="Интерфейс";}
    :list_box {label=""; key="txt-05"; list=""; width=16; height=3; value="0";}//list_box

  	:text {label="GSM-модем";}
  	:list_box {label=""; key="txt-09"; list=""; width=16; height=3; value="0";}//list_box
  	
		:text {label="Длина кабеля";}
		:text {label="связи, м";}
		:edit_box {label=""; key="txt-08"; list=""; width=3; height=1; value="10";} 	

  	:row {label=""; height=0.5;}//row

  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-901"; list=""; width=60; height=20; value="0";}
	}//column
    
}//row

:row {label="";}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ СА"; key="but2"; height=1;}
	:button {label="СПЦФ СА"; key="but3"; height=1;}
	:button {label="ПЭ ТХ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
