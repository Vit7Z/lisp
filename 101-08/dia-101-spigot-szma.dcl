///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_spigot_szma: dialog {label = "Втулка полуразъемная";

:row {label="";
  :column {label="Тип";
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=10; height=20; value=0;}//list_box
  }//column
  
  :column {label="Внутренний";
    :text {label=" диаметр";}
    :text {label=" трубы, мм";}
    :list_box {key="txt-11"; list=""; width=10; height=20; value=0; is_enabled=false;}//list_box
  }//column  
  
  :column {label="Условный";
    :text {label=" проход";}
    :text {label=" трубы";}
    :list_box {key="txt-12"; list=""; width=10; height=20; value=0; is_enabled=false;}//list_box
  }//column
  
}//row
ok_cancel;
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////