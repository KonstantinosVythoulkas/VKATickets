/******/ (function(modules) { // webpackBootstrap
/******/ 	// The module cache
/******/ 	var installedModules = {};
/******/
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/
/******/ 		// Check if module is in cache
/******/ 		if(installedModules[moduleId]) {
/******/ 			return installedModules[moduleId].exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = installedModules[moduleId] = {
/******/ 			i: moduleId,
/******/ 			l: false,
/******/ 			exports: {}
/******/ 		};
/******/
/******/ 		// Execute the module function
/******/ 		modules[moduleId].call(module.exports, module, module.exports, __webpack_require__);
/******/
/******/ 		// Flag the module as loaded
/******/ 		module.l = true;
/******/
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/
/******/
/******/ 	// expose the modules object (__webpack_modules__)
/******/ 	__webpack_require__.m = modules;
/******/
/******/ 	// expose the module cache
/******/ 	__webpack_require__.c = installedModules;
/******/
/******/ 	// define getter function for harmony exports
/******/ 	__webpack_require__.d = function(exports, name, getter) {
/******/ 		if(!__webpack_require__.o(exports, name)) {
/******/ 			Object.defineProperty(exports, name, { enumerable: true, get: getter });
/******/ 		}
/******/ 	};
/******/
/******/ 	// define __esModule on exports
/******/ 	__webpack_require__.r = function(exports) {
/******/ 		if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 			Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 		}
/******/ 		Object.defineProperty(exports, '__esModule', { value: true });
/******/ 	};
/******/
/******/ 	// create a fake namespace object
/******/ 	// mode & 1: value is a module id, require it
/******/ 	// mode & 2: merge all properties of value into the ns
/******/ 	// mode & 4: return value when already ns object
/******/ 	// mode & 8|1: behave like require
/******/ 	__webpack_require__.t = function(value, mode) {
/******/ 		if(mode & 1) value = __webpack_require__(value);
/******/ 		if(mode & 8) return value;
/******/ 		if((mode & 4) && typeof value === 'object' && value && value.__esModule) return value;
/******/ 		var ns = Object.create(null);
/******/ 		__webpack_require__.r(ns);
/******/ 		Object.defineProperty(ns, 'default', { enumerable: true, value: value });
/******/ 		if(mode & 2 && typeof value != 'string') for(var key in value) __webpack_require__.d(ns, key, function(key) { return value[key]; }.bind(null, key));
/******/ 		return ns;
/******/ 	};
/******/
/******/ 	// getDefaultExport function for compatibility with non-harmony modules
/******/ 	__webpack_require__.n = function(module) {
/******/ 		var getter = module && module.__esModule ?
/******/ 			function getDefault() { return module['default']; } :
/******/ 			function getModuleExports() { return module; };
/******/ 		__webpack_require__.d(getter, 'a', getter);
/******/ 		return getter;
/******/ 	};
/******/
/******/ 	// Object.prototype.hasOwnProperty.call
/******/ 	__webpack_require__.o = function(object, property) { return Object.prototype.hasOwnProperty.call(object, property); };
/******/
/******/ 	// __webpack_public_path__
/******/ 	__webpack_require__.p = "/packs/";
/******/
/******/
/******/ 	// Load entry module and return exports
/******/ 	return __webpack_require__(__webpack_require__.s = "./app/javascript/packs/new_user_checks.js");
/******/ })
/************************************************************************/
/******/ ({

/***/ "./app/javascript/packs/new_user_checks.js":
/*!*************************************************!*\
  !*** ./app/javascript/packs/new_user_checks.js ***!
  \*************************************************/
/*! no static exports found */
/***/ (function(module, exports) {

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: C:\\Users\\local_vjob8rt\\Working\\Tickets\\app\\javascript\\packs\\new_user_checks.js: Unexpected token (4:42)\n\n  2 |\n  3 | $('#username').on('keyup', function (){\n> 4 |     if ($('#username').val().length < 4 &&){\n    |                                           ^\n  5 |         $('#username_valid').css('color','red');\n  6 |     }\n  7 |     else if ($('#username').val().match(\"^[A-Za-z]+$\")) {\n    at Parser._raise (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:776:17)\n    at Parser.raiseWithData (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:769:17)\n    at Parser.raise (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:737:17)\n    at Parser.unexpected (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:9735:16)\n    at Parser.parseExprAtom (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11131:20)\n    at Parser.parseExprSubscripts (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10708:23)\n    at Parser.parseUpdate (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10688:21)\n    at Parser.parseMaybeUnary (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10666:23)\n    at Parser.parseExprOpBaseRightExpr (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10609:34)\n    at Parser.parseExprOpRightExpr (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10602:21)\n    at Parser.parseExprOp (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10568:27)\n    at Parser.parseExprOp (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10576:21)\n    at Parser.parseExprOps (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10529:17)\n    at Parser.parseMaybeConditional (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10497:23)\n    at Parser.parseMaybeAssign (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10460:21)\n    at Parser.parseExpressionBase (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10405:23)\n    at C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10399:39\n    at Parser.allowInAnd (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12098:16)\n    at Parser.parseExpression (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10399:17)\n    at Parser.parseHeaderExpression (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12530:22)\n    at Parser.parseIfStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12618:22)\n    at Parser.parseStatementContent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12304:21)\n    at Parser.parseStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12259:17)\n    at Parser.parseBlockOrModuleBlockBody (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12845:25)\n    at Parser.parseBlockBody (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12836:10)\n    at Parser.parseBlock (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12820:10)\n    at Parser.parseFunctionBody (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11777:24)\n    at Parser.parseFunctionBodyAndFinish (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11761:10)\n    at C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12978:12\n    at Parser.withTopicForbiddingContext (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12073:14)");

/***/ })

/******/ });
//# sourceMappingURL=new_user_checks-18b0964c37aa3ddcc0ad.js.map