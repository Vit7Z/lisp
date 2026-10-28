;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// приборы для измерения давления                              ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-prs-relay-dm-2005

( / adoc dcl-id list-01 list-02 list-03 type-list-01 type-list-02 type-list-03)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "МП4-У, Манотомь"
;										"КМ, Росма"						  			
;						 				"МТИ, Энгельс"
;										"МПТИ, Манотомь"
;										"Перепад ДСП-80В-РАСКО"
										));setq

(setq list-02 (list "Датчик-реле DUNGS"
										"Датчик-реле ДЕМ 102"
										"Датчик-реле ДЕМ 107"
										"Датчик-реле ДН"
										"Реле давления KPI 35"
										"Реле давления РД-2Р"
										"Тягонапоромер ДГ"
										"ЭКМ ДМ 2005"
										"ЭКМ ДМ 2005Сг1Ex+"
										"Перепад ДЕМ 202"
										
										));setq
						
(setq list-03 (list 
										"WIKA OT-1" 
										"ОВЕН ПД100"
										"Метран 55"
										"Метран 150 изб."
										"Метран 150 перепад"
										"Элемер АИР-10 изб."
										"Элемер АИР-30 перепад"																											
										"Эталон EJA310"
										"Эталон EJA530"
										
										));setq
		
		
(if (< (setq dcl-id (load_dialog "dia-101-01-prs-relay-dm-2005.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_press_sens" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

(action_tile "txt-01"
  (strcat "(setq type-list-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq type-list-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq type-list-03 (nth (atoi (get_tile \"txt-03\")) list-03))"
  				"(done_dialog)"
  );strcat
);action_tile



(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list-01 "МП4-У, Манотомь") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-gauge-mp4-u-01-general.lsp") (101-01-prs-gauge-mp4-u-01-general));if
	;
;	((= type-list-01 "КМ, Росма") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-01-rosma-km.lsp") (101-01-prs-01-rosma-km));if
;	((= type-list-01 "МТИ, Энгельс") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-01-mti-manometr.lsp") (101-01-prs-01-mti-manometr));if
;	((= type-list-01 "МПТИ, Манотомь") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-01-mpti-manotom.lsp") (101-01-prs-01-mpti-manotom));if
);cond
							
(cond	
;	((= type-list-02 "Датчик-реле ДЕМ 102") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-relay-dem-102.lsp") (101-01-prs-relay-dem-102));if
;	
;	((= type-list-02 "Датчик-реле ДЕМ 107") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dem-107.lsp") (101-01-prs-relay-dem-107));if
;	((= type-list-02 "Датчик-реле ДН") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-relay-teplopribor-c-dn.lsp") (101-01-prs-relay-teplopribor-c-dn));if
;	((= type-list-02 "Датчик-реле DUNGS") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dungs-01-general.lsp") (101-01-prs-01-dungs-01-general));if
	((= type-list-02 "ЭКМ ДМ 2005") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dm-2005.lsp") (101-01-prs-relay-dm-2005));if
;	((= type-list-02 "ЭКМ ДМ 2005Сг1Ex+") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-01-dm2005-sg-1ex.lsp") (101-01-prs-01-dm2005-sg-1ex));if
;	
;	((= type-list-02 "Реле давления KPI 35") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-kpi-35.lsp") (101-kpi-35));if
;	((= type-list-02 "Реле давления РД-2Р") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-01-rosma-rd-2r.lsp") (101-01-prs-01-rosma-rd-2r));if
;	((= type-list-02 "Тягонапоромер ДГ") (load "d:\\mcloud\\my-sprt\\101-01-prs-01\\101-01-prs-01-spz-dg.lsp") (101-01-prs-01-spz-dg));if
);cond
	
(cond	
	((= type-list-03 "Метран 150 изб.") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-sens-metran-150-pt.lsp") (101-01-prs-sens-metran-150-pt));if
	((= type-list-03 "Метран 150 перепад") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-sens-metran-150-diff.lsp") (101-01-prs-sens-metran-150-diff));if


;	((= type-list-03 "Метран 55") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-01-metran-55.lsp") (101-metran-55-pt));if
;	
;	((= type-list-03 "ОВЕН ПД100") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-01-owen-pd-01-general-1.lsp") (101-01-prs-01-owen-pd-general-1));if
;	((= type-list-03 "WIKA OT-1") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-01-wika-general-1.lsp") (101-01-prs-01-wika-general-1));if
;	((= type-list-03 "Элемер АИР-10 изб.") (load "d:\\mcloud\\my-sprt\\101-01-prs\\101-01-prs-over-sens-elemer-air-10-pt.lsp") (101-01-prs-over-sens-elemer-air-10-pt));if
;	
;	
;	

);cond


(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////