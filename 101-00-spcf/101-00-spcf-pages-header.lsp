;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// шапка спецификации                                           /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun 101-00-spcf-pages-header

( / adoc pnt-ins pnt-ins-head pnt-ins-stamp pnt-txt32 rctn-23 rctn-24 rctn-25 rctn-26 rctn-27 rctn-28 rctn-29 rctn-30 rctn-31 rctn-32 rctn-33 rctn-34 rctn-35 rctn-36 rctn-37 rctn-38 rctn-39 
rctn-40 txt-10 txt-11 txt-12 txt-13 txt-14 txt-15 txt-16 txt-17 txt-18 txt-19 txt-20 txt-21 txt-22 txt-32 txt-5 txt-6 txt-7 txt-8 txt-9 x-pnt-ins y-pnt-ins)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(if (= (tblsearch "block" "зс-шапка" ) nil)
	(progn				
	  (setvar	"OSMODE" 0)
		(setvar	"CLAYER" "0")
		(setvar "CELWEIGHT" 60) ;шапка
		(command "_RECTANGLE" '(0 0) '(20 -25))
		(setq rctn-23 (entlast))
		(command "_RECTANGLE" '(20 0) '(150 -25))
		(setq rctn-24 (entlast))
		(command "_RECTANGLE" '(150 0) '(210 -25))
		(setq rctn-25 (entlast))
		(command "_RECTANGLE" '(210 0) '(245 -25))
		(setq rctn-26 (entlast))	
		(command "_RECTANGLE" '(245 0) '(290 -25))
		(setq rctn-27 (entlast))	
		(command "_RECTANGLE" '(290 0) '(310 -25))
		(setq rctn-28 (entlast))	
		(command "_RECTANGLE" '(310 0) '(330 -25))
		(setq rctn-29 (entlast))	
		(command "_RECTANGLE" '(330 0) '(355 -25))
		(setq rctn-30 (entlast))	
		(command "_RECTANGLE" '(355 0) '(395 -25))
		(setq rctn-31 (entlast))	
		(command "_RECTANGLE" '(0 -25) '(20 -33))
		(setq rctn-32 (entlast))	
		(command "_RECTANGLE" '(20 -25) '(150 -33))
		(setq rctn-33 (entlast))	
		(command "_RECTANGLE" '(150 -25) '(210 -33))
		(setq rctn-34 (entlast))	
		(command "_RECTANGLE" '(210 -25) '(245 -33))
		(setq rctn-35 (entlast))	
		(command "_RECTANGLE" '(245 -25) '(290 -33))
		(setq rctn-36 (entlast))
		(command "_RECTANGLE" '(290 -25) '(310 -33))
		(setq rctn-37 (entlast))	
		(command "_RECTANGLE" '(310 -25) '(330 -33))
		(setq rctn-38 (entlast))
		(command "_RECTANGLE" '(330 -25) '(355 -33))
		(setq rctn-39 (entlast))	
		(command "_RECTANGLE" '(355 -25) '(395 -33))
		(setq rctn-40 (entlast))
				
		(setvar "CELWEIGHT" -1)
		(command "_TEXT" "_MC" '(10 -12.5) 2.5 0 "Позиция")
		(setq txt-5 (entlast))
		(command "_TEXT" "_MC" '(85 -12.5) 2.5 0 "Наименование и техническая характеристика")
		(setq txt-6 (entlast))
		(command "_MTEXT" '(150 0) "_j" "_mc" '(210 -25) "Тип, марка, обозначение документа, опросного листа" "")
		(setq txt-7 (entlast))
		(command "_MTEXT" '(210 0) "_j" "_mc" '(245 -25) "Код оборудования, изделия, материала" "")
		(setq txt-8 (entlast))
		(command "_TEXT" "_MC" '(267.5 -12.5) 2.5 0 "Завод-изготовитель")
		(setq txt-9 (entlast))
		(command "_MTEXT" '(290 0) "_j" "_mc" '(310 -25) "Единица измерения" "")
		(setq txt-10 (entlast))
		(command "_MTEXT" '(310 0) "_j" "_mc" '(330 -25) "Коли- чество" "")
		(setq txt-11 (entlast))
		(command "_MTEXT" '(330 0) "_j" "_mc" '(355 -25) "Масса единицы, кг." "")
		(setq txt-12 (entlast))
		(command "_TEXT" "_MC" '(375 -12.5) 2.5 0 "Примечание")
		(setq txt-13 (entlast))
		(command "_TEXT" "_MC" '(10 -29) 3.5 0 "1")
		(setq txt-14 (entlast))
		(command "_TEXT" "_MC" '(85 -29) 3.5 0 "2")
		(setq txt-15 (entlast))
		(command "_TEXT" "_MC" '(180 -29) 3.5 0 "3")
		(setq txt-16 (entlast))
		(command "_TEXT" "_MC" '(227.5 -29) 3.5 0 "4")
		(setq txt-17 (entlast))
		(command "_TEXT" "_MC" '(267.5 -29) 3.5 0 "5")
		(setq txt-18 (entlast))
		(command "_TEXT" "_MC" '(300 -29) 3.5 0 "6")
		(setq txt-19 (entlast))
		(command "_TEXT" "_MC" '(320 -29) 3.5 0 "7")
		(setq txt-20 (entlast))
		(command "_TEXT" "_MC" '(342.5 -29) 3.5 0 "8")
		(setq txt-21 (entlast))
		(command "_TEXT" "_MC" '(375 -29) 3.5 0 "9")
		(setq txt-22 (entlast))
			
		(command "_block" "зс-шапка"		'(0 0)
				rctn-23		rctn-24		rctn-25		rctn-26		rctn-27
				rctn-28		rctn-29		rctn-30		rctn-31		rctn-32		rctn-33		rctn-34
				rctn-35		rctn-36		rctn-37		rctn-38		rctn-39		rctn-40		
				txt-5		txt-6		txt-7		txt-8		txt-9
				txt-10	txt-11	txt-12	txt-13	txt-14	txt-15	txt-16	txt-17		txt-18
				txt-19	txt-20	txt-21	txt-22
		"");command
	); end progn
); end if

(vla-endundomark adoc)

(setvar "osmode" 6199)

(setvar "orthomode" 1)

(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////