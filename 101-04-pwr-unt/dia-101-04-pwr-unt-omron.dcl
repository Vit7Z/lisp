///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_pwr_unt_omron: dialog {label = "БП Omron";

:row {label="";
   :column { 
      :text {label="Серия";}
      :text {label="";}
      :list_box {key="txt-01"; list=""; width=10; height=9; value=0;
      }//list_box
    }//column

   :column {label=""; 
      :text {label="Артикул";}
      :text {label="";}
      :list_box {key="txt-02"; list=""; width=15; height=9; value=0;
      }//list_box
    }//column

   :column {label=""; 
      :text {label="Uвход,";}
      :text {label="В";}
      :list_box {key="txt-03"; list=""; width=15; height=9; value=0;
      }//list_box
    }//column

    :column {label="";
      :text {label="Uвыход,"; key="ptxt-041";}
      :text {label="В"; key="ptxt-042";}
      :list_box {key="txt-04"; list=""; width=15; height=9; value= "0";}
    }//column
    
    :column {label=""; 
			:text {label="Iнагр,"; key="ptxt-051";}
      :text {label="А"; key="ptxt-052";}			
      :list_box {key="txt-05"; list=""; width=10; height=9; value= "0";}
    }//column    

  :column {label=""; 
  	:text {label="Крепление";}
  	:text {label="";}
    :list_box {key="txt-06"; list=""; width=10; height=9; value= "0";}
  }//column

  :column {label=""; 
  	:text {label="Развязка"; key="ptxt-071";}
  	:text {label="каналов"; key="ptxt-072";}
    :list_box {key="txt-07"; list=""; width=10; height=9; value= "0";}
  }//column

  :column {label=""; 
  	:text {label="Масса,";}
  	:text {label="кг";}
    :list_box {key="txt-08"; list=""; width=10; height=9; value= "0";}
  }//column

  :column {label="";
  	:text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-1001"; list=""; width=50; height=9; value= "0";}
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }
		:list_box {label=""; key="txt-901"; list=""; width=50; height=9; value= "0";}
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
