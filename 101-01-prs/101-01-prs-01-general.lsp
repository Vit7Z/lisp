;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// приборы для измерения давления                              ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-prs-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 type-list-01 type-list-02 type-list-03 type-list-04 type-list-05)

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

(setq list-02 (list "ПД100, ОВЕН"
										"МЕТРАН 55, Метран"
										"МЕТРАН 150, Метран"										
										"АИР-10, ЭЛЕМЕР"
										"АИР-20/М2-Н, ЭЛЕМЕР"																																									
));setq
						
(setq list-03 (list "МЕТРАН 150, Метран"
										"АИР-20/М2-Н, ЭЛЕМЕР"																								
));setq

(setq list-04 (list "Датчик-реле DUNGS"
										"Датчик-реле ДЕМ 102"
										"Датчик-реле ДЕМ 107"
										"Датчик-реле ДН"
										"Реле давления KPI 35"
										"Реле давления РД-2Р"
										"Тягонапоромер ДГ"
										"ЭКМ ДМ, Манотомь"
));setq

(setq list-05 (list "Датчик-реле ДЕМ 202 перепад"
));setq
		
		
(if (< (setq dcl-id (load_dialog "dia-101-01-prs-01-general.dcl")) 0) ;ищем диалог
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
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)

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

(action_tile "txt-04"
  (strcat "(setq type-list-04 (nth (atoi (get_tile \"txt-04\")) list-04))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq type-list-05 (nth (atoi (get_tile \"txt-05\")) list-05))"
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
	((= type-list-01 "МП4-У, Манотомь") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-gauge-mp4-u-01-general.lsp") (101-01-prs-gauge-mp4-u-01-general));if
	;
;	((= type-list-01 "КМ, Росма") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-01-rosma-km.lsp") (101-01-prs-01-rosma-km));if
;	((= type-list-01 "МТИ, Энгельс") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-01-mti-manometr.lsp") (101-01-prs-01-mti-manometr));if
;	((= type-list-01 "МПТИ, Манотомь") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-01-mpti-manotom.lsp") (101-01-prs-01-mpti-manotom));if
);cond
							
(cond
	((= type-list-02 "ПД100, ОВЕН") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-owen-pd-100-01-general.lsp") (101-01-prs-sens-owen-pd-100-01-general));if
	
  ((= type-list-02 "МЕТРАН 55, Метран") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-metran-55-pt-01-general.lsp") (101-01-prs-sens-metran-55-pt-01-general));if

	((= type-list-02 "МЕТРАН 150, Метран") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-metran-150-pt-01-general.lsp") (101-01-prs-sens-metran-150-pt-01-general));if

	((= type-list-02 "АИР-10, ЭЛЕМЕР") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-elemer-air-10-pt-01-general.lsp") (101-01-prs-sens-elemer-air-10-pt-01-general));if

	((= type-list-02 "АИР-20/М2-Н, ЭЛЕМЕР") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-elemer-air-20-m2-n-pt-01-general.lsp") (101-01-prs-sens-elemer-air-20-m2-n-pt-01-general));if
);cond


(cond	
	((= type-list-03 "МЕТРАН 150, Метран") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-metran-150-pd-01-general.lsp") (101-01-prs-sens-metran-150-pd-01-general));if
	
	((= type-list-03 "АИР-20/М2-Н, ЭЛЕМЕР") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-sens-elemer-air-20-m2-n-pd-01-general.lsp") (101-01-prs-sens-elemer-air-20-m2-n-pd-01-general));if
);cond


(cond	
	((= type-list-04 "Датчик-реле DUNGS") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dungs-01-general.lsp") (101-01-prs-relay-dungs-01-general));if

	((= type-list-04 "Датчик-реле ДЕМ 102") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-relay-dem-102-01-general.lsp") (101-01-prs-relay-dem-102-01-general));if
	
	((= type-list-04 "Датчик-реле ДЕМ 107") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dem-107-01-general.lsp") (101-01-prs-relay-dem-107-01-general));if
	
	((= type-list-04 "Датчик-реле ДН") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dn-01-general.lsp") (101-01-prs-relay-dn-01-general));if

	((= type-list-04 "Реле давления KPI 35") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-kpi-35-01-general.lsp") (101-01-prs-relay-kpi-35-01-general));if
	
	((= type-list-04 "Реле давления РД-2Р") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-rd-2r-01-general.lsp") (101-01-prs-relay-rd-2r-01-general));if
	
	((= type-list-04 "Тягонапоромер ДГ") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-dg-01-general.lsp") (101-01-prs-relay-dg-01-general));if
	
	((= type-list-04 "ЭКМ ДМ 2005, Манотомь") (load "d:\\yandexdisk\\my-sprt\\101-01-prs\\101-01-prs-relay-dm-2005-01-general.lsp") (101-01-prs-relay-dm-2005-01-general));if
);cond


(cond	
	((= type-list-05 "Датчик-реле ДЕМ 202 перепад") (load "d:\\yandexdisk\\my-sprt\\101-01-prs-01\\101-01-prs-relay-diff-dem-202-01-general.lsp") (101-01-prs-relay-diff-dem-202-01-general));if
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////