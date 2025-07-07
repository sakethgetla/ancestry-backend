import express, { Request, Response } from 'express'
import { PrismaClient } from '@prisma/client'

const prisma = new PrismaClient({
    log: ['query', 'info', 'warn', 'error']
})
const app = express()
app.use(express.json())

app.post('/people', async (req: Request, res: Response) => {
    const person = await prisma.ancestor.create({
        data: {
            name: req.body.name,
            email: req.body.email,
        }
    })
    res.send({
        Riosetn: 'ioarenst',
        person: person
    })
})

app.get('/', (req: Request, res: Response) => {
    res.send('Hello World')
    console.log("Hello World");
})

app.get('/people/:id', async (req: Request, res: Response) => {
    const id = req.params.id
    const person = await prisma.ancestor.findUnique({
        where: {
            id: id
        }
    })
    res.send({
        rsiten: 'ioarenst',
        id: person?.id,
        name: person?.name,
        email: person?.email
    })

})


app.listen(3000)
