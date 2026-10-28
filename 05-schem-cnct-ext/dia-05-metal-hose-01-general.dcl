///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_05_metal_hose: dialog {label = "Металлорукав";

:row {label="";
  :column {label="";
    :text {label="Марка";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Ду,";}
    :text {label="мм";}
    :list_box {key="txt-02"; list=""; width=6; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Диаметр";}
    :text {label="внутр., мм";}
    :list_box {key="txt-03"; list=""; width=6; height=15; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Описание"; }
		:text {label="";}
		:list_box {label=""; key="txt-900"; list=""; width=25; height=15; value= "0";}
	}//column
}//row

:row {label="";
	:column {label="";
		:button {label="Рисовать"; key="but1"; height=1;}
	}//column

	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
