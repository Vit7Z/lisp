;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// контроллеры                                                 ////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-plc-01-general

( / adoc dcl-id list-01 list-02 list-03 type-list-01 type-list-02)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "S7-300"
						  			"S7-400"
						  			"S7-1200"
						  			"S7-1500"
										"ET200SP"										
										"LOGO!"					  			
						  			"Soft")
);setq

(setq list-02 (list "ОВЕН ПЛК")
);setq

(setq list-03 (list "ЭЛСИ-ТМК")
);setq

(if (< (setq dcl-id (load_dialog "dia-101-01-plc-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_plc_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

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


(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list-01 "LOGO!") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-logo.lsp") (101-01-plc-logo));=
	
	((= type-list-01 "S7-300") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-s7-300.lsp") (101-01-plc-s7-300));=
	
	((= type-list-01 "S7-400") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-s7-400.lsp") (101-01-plc-s7-400));=
	
	((= type-list-01 "S7-1200") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-s7-1200.lsp") (101-01-plc-s7-1200));="Siemens S7-1500"
	
	((= type-list-01 "S7-1500") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-s7-1500.lsp") (101-01-plc-s7-1500));="Siemens S7-1500"
	
	((= type-list-01 "ET200SP") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-et-200sp.lsp") (101-01-plc-et-200sp))
	
	((= type-list-01 "Soft") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-smns\\101-01-plc-soft-01-siemens.lsp") (101-01-plc-soft-01-siemens));=
	
	
	((= type-list-02 "ОВЕН ПЛК") (load "d:\\yandexdisk\\my-sprt\\101-01-plc-01\\101-01-plc-owen-01-general.lsp") (101-01-plc-owen-01-general));=
	
	((= type-list-01 "ЭЛСИ-ТМК") (load "d:\\yandexdisk\\my-sprt\\101-01-plc\\101-01-plc-tmk.lsp") (101-01-plc-tmk));=
	
	((= type-list-01 "AB ContrloLogix") (load "d:\\yandexdisk\\my-sprt\\101-01-plc\\101-01-plc-ab-control-logix.lsp") (101-01-plc-ab-control-logix));=
);cond


(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////