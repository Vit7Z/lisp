;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;///////                                                              //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-07-mtrl-01-general

( / adoc dcl-id list-01 list-02 txt-01 txt-02)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq txt-01 nil

			list-01 (list	"Металлорукав, ИЭК"
										
							);list
							
			list-02 (list	"Труба импульсная"
										"Труба ВГП ГОСТ 8232"
							);list
							
							
;			list-01 (list	"Металлорукав, ИЭК"
;										"Труба импульсная"
;										"Труба ВГП ГОСТ 8232"
;							);list
);setq

(if (< (setq dcl-id (load_dialog "dia-101-07-mtrl-01-general.dcl")) 0) ;ищем диалог
	(progn
		(alert "Не найден dcl-файл")
		(exit)
	);progn
);if

(if (not (new_dialog "dia_101_07_mtrl_01_general" dcl-id))
	(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)

(action_tile "txt-01"
  (strcat "(setq txt-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq txt-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
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
	((= txt-01 "Металлорукав, ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-07\\101-07-mtrl-metal-hose-iek-01-general.lsp") (101-07-mtrl-metal-hose-iek-01-general));=
	
);cond

(cond	
	((= txt-02 "Труба импульсная") (load "d:\\yandexdisk\\my-sprt\\101-07\\101-07-mtrl-pipe-imp-01.lsp") (101-07-mtrl-pipe-imp-01));=
	
	((= txt-02 "Труба ВГП ГОСТ 8232") (load "d:\\yandexdisk\\my-sprt\\101-07\\101-07-mtrl-pipe-gost-3262.lsp") (101-07-mtrl-pipe-gost-3262));=
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;/////// конец программы ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
