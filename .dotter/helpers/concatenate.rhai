let value     = "";
let delimeter = " ";

if params.len > 1 {
    delimeter = params[1];
}

// This can be replaced with join once handlebars is updated
for key in range(0, params[0].len()) {
    value += params[0][key];

    if key != params[0].len() - 1 {
        value += delimeter;
    }
}

return value;
