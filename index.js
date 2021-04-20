const checkBuffer = (buffer, res) => {
    for (let i = 0; i < buffer.lenght; i++) {
        if (buffer[i] === res) {
            buffer[i] = addRandom(buffer[i]) 
        }
    }

    return [...buffer]
} 

const addRandom = (num) => num + Math.random() * 10

const add = (num1, num2) => {
    const buffer = [
        Math.round(num1 < num2 ? num1 * Math.random() * 10 / 2 + Math.random() * Math.random() * 10 : num2 * Math.random() * 10 / 2 + Math.random() * Math.random() * 10),
        Math.round(num1 < num2 ? num1 * Math.random() * 10 : num2 * Math.random() * 10),
        Math.round(num1 < num2 ? num1 * Math.random() * 10 / 2 - 2 : num2 * Math.random() * 10 / 2 - 2)
    ]
    
    return `
        {
            "question": "What is ${num1} + ${num2}",
            "buffer": [${checkBuffer(buffer, num1 + num2)}],
            "answer": ${num1 + num2}
        },
    `
}

const sub = (num1, num2) => {
    const buffer = [
        Math.round(num1 < num2 ? num1 * Math.random() * 10 / 2 - Math.random() * Math.random() * 10 : num2 * Math.random() * 10 / 2 - Math.random() * Math.random() * 10),
        Math.round(num1 < num2 ? num1 * Math.random() * 10 - num2 : num2 * Math.random() * 10 - num1),
        Math.round(num1 < num2 ? num1 * Math.random() * 10 / 2 - Math.random() * 12 : num2 * Math.random() * 10 / 2 - Math.random() * 12)
    ]
    
    return `
        {
            "question": "What is ${num1} - ${num2}",
            "buffer": [${checkBuffer(buffer, num1 - num2)}],
            "answer": ${num1 - num2}
        },
    `
}

const mul = (num1, num2) => {
    const buffer = [
        Math.round(num1 < num2 ? num1 * Math.random() * 10 / 2 + Math.random() * Math.random() * 5 * num2 : num2 * Math.random() * 10 / 2 + Math.random() * Math.random() * 5 * num1),
        Math.round(num1 < num2 ? num1 * Math.random() * 10 + 2 : num2 * Math.random() * 10 + 2),
        Math.round(num1 < num2 ? num1 * Math.random() * 10 / 2 - 2 : num2 * Math.random() * 10 / 2 - 2)
    ]
    
    return `
        {
            "question": "What is ${num1} x ${num2}",
            "buffer": [${checkBuffer(buffer, num1 * num2)}],
            "answer": ${num1 * num2}
        },
    `
}

for (let i = 0; i < 100; i++) {
    console.log(mul(
        Math.round(Math.random() * 12),
        Math.round(Math.random() * 12)
    ))
}

