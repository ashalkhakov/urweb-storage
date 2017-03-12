var UrWeb = {
    Storage: {
	length: function(s) { return s.length; },
	key: function(s, n) { return s.key(n); },
	getItem: function(s, k) { return s.getItem(k); },
	setItem: function(s, k, v) { return s.setItem(k, v); },
	removeItem: function(s, k) { return s.removeItem(k); },
	clear: function(s) { s.clear(); },
	getLocalStorage: function () {
	    // thanks to:
	    // https://mathiasbynens.be/notes/localstorage-pattern
	    var storage;
	    var fail;
	    var uid;
	    try {
		uid = new Date();
		(storage = window.localStorage).setItem(uid, uid);
		fail = storage.getItem(uid) != uid;
		storage.removeItem(uid);
		return fail? null : storage;
	    } catch (exception) {
		return null;
	    }
	},
	getSessionStorage: function() {
	    var storage;
	    var fail;
	    var uid;
	    try {
		uid = new Date();
		(storage = window.sessionStorage).setItem(uid, uid);
		fail = storage.getItem(uid) != uid;
		storage.removeItem(uid);
		return fail? null : storage;
	    } catch (exception) {
		return null;
	    }	    
	}
    }
};
