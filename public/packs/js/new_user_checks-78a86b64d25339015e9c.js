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

throw new Error("Module build failed (from ./node_modules/babel-loader/lib/index.js):\nSyntaxError: C:\\Users\\local_vjob8rt\\Working\\Tickets\\app\\javascript\\packs\\new_user_checks.js: Missing semicolon (68:47)\n\n  66 |     $('#password_match').css('color','wheat');\n  67 |\n> 68 | } else ( $('#new_password').val().length >= 8 ){\n     |                                                ^\n  69 |     $('#password_length').css('color','#00ed04');\n  70 |\n  71 | } if ($('#new_password').val() == $('#password_com').val() && $('#new_password').val().length >= 8 && $('#username').val().length >= 4 && $('#username').val().match(\"^[A-Za-z]+$\") ) {\n    at Parser._raise (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:776:17)\n    at Parser.raiseWithData (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:769:17)\n    at Parser.raise (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:737:17)\n    at Parser.semicolon (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:9717:10)\n    at Parser.parseExpressionStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12803:10)\n    at Parser.parseStatementContent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12395:19)\n    at Parser.parseStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12259:17)\n    at Parser.parseIfStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12620:51)\n    at Parser.parseStatementContent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12304:21)\n    at Parser.parseStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12259:17)\n    at Parser.parseIfStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12620:51)\n    at Parser.parseStatementContent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12304:21)\n    at Parser.parseStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12259:17)\n    at Parser.parseIfStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12620:51)\n    at Parser.parseStatementContent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12304:21)\n    at Parser.parseStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12259:17)\n    at Parser.parseIfStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12620:51)\n    at Parser.parseStatementContent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12304:21)\n    at Parser.parseStatement (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12259:17)\n    at Parser.parseBlockOrModuleBlockBody (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12845:25)\n    at Parser.parseBlockBody (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12836:10)\n    at Parser.parseBlock (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12820:10)\n    at Parser.parseFunctionBody (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11777:24)\n    at Parser.parseFunctionBodyAndFinish (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11761:10)\n    at C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12978:12\n    at Parser.withTopicForbiddingContext (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12073:14)\n    at Parser.parseFunction (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:12977:10)\n    at Parser.parseFunctionOrFunctionSent (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11215:17)\n    at Parser.parseExprAtom (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:11051:21)\n    at Parser.parseExprSubscripts (C:\\Users\\local_vjob8rt\\Working\\Tickets\\node_modules\\@babel\\parser\\lib\\index.js:10708:23)");

/***/ })

/******/ });
//# sourceMappingURL=new_user_checks-78a86b64d25339015e9c.js.map