var records = [{
    id: '2110000004',
    username: '2110000004',
    password: 'password',
    type: 'instructor',
}];

exports.isOkay = function(id, pass) {
    for (var i = 0; i < records.length; i++) {
        if (records[i].id == id && records[i].password == pass) {
            return records[i].id;
        }
    }
    return -1;
}

exports.findById = function(id, cb) {
    process.nextTick(function() {
        var idx = id - 1;
        if (records[idx]) {
            cb(null, records[idx]);
        } else {
            cb(new Error('User ' + id + ' does not exist'));
        }
    });
}

exports.findByUsername = function(username, cb) {
    process.nextTick(function() {
        for (var i = 0, len = records.length; i < len; i++) {
            var record = records[i];
            if (record.username === username) {
                return cb(null, record);
            }
        }
        return cb(null, null);
    });
}