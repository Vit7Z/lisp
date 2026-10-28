///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_07_metal_hose_iek: dialog {label = "Металлорукав ИЭК";

:row {label="";
  :column {label="";
    :text {label="Марка";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Ду,";}
    :text {label="мм";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=6; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Наружн.";}
    :text {label="диаметр,";}
    :text {label="мм";}
    :list_box {key="txt-04"; list=""; width=8; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Внутр.";}
    :text {label="диаметр,";}
    :text {label="мм";}
    :list_box {key="txt-05"; list=""; width=8; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Масса"; key="ptxt-31";}
    :text {label="1м, кг"; key="ptxt-32";}
    :text {label=""; key="ptxt-33";}
    :list_box {key="txt-06"; list=""; width=8; height=15; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано";}
		:text {label="";}
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=40; height=15; value= "0";}
	}//column

}//row

:row {label="";
	:list_box {key="txt-900"; list=""; width=22; height=5; value=0;}//list_box
}//row



:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="ПЭ ЧРО"; key="but3"; height=1;}
	:button {label="СПЦФ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
