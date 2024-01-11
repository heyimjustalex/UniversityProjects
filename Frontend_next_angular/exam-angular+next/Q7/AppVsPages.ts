// NAMING

// pages approach (files are paths)

└── pages
    ├── about.js
    ├── index.js
    └── team.js


// app approach (only foldernames are paths)

src/
└── app
    ├── about
    │   └── page.js
    ├── globals.css
    ├── layout.js
    ├── login
    │   └── page.js
    ├── page.js 
    └── team
        └── route.js

// SSR 

// pages

export default function Page({ data }) {
    // Render data...
  }
   
  // This gets called on every request
  export async function getServerSideProps() {
    // Fetch data from external API
    const res = await fetch(`https://.../data`)
    const data = await res.json()
   
    // Pass data to the page via props
    return { props: { data } }
  }

export default function Blog({ posts }) {
  // Render posts...
}
 
// This function gets called at build time
export async function getStaticProps() {
  // Call an external API endpoint to get posts
  const res = await fetch('https://.../posts')
  const posts = await res.json()
 
  // By returning { props: { posts } }, the Blog component
  // will receive `posts` as a prop at build time
  return {
    props: {
      posts,
    },
  }
}
//app

export async function Page() {
    const myDataQ = await fetch (....)
    const data = await myDataQ.json()
    return <ClientComp data={data}/>
  }
  
  #/ClientComp.tsx
  "use client"
  export const ClientComp = ({data}) => { 
    return <div> {data} </div>
  }



  // NEXT.JS BACKEND REQUEST HANDLER
//pages
  
export default function handler(
    req: NextApiRequest,
    res: NextApiResponse<ResponseData>
  ) {
  }


// app
// GET, POST are the method names, in pages it's "handler"
export async function GET() {
    const res = await fetch('https://data.mongodb-api.com/...', {
      headers: {
        'Content-Type': 'application/json',
        'API-Key': process.env.DATA_API_KEY,
      },
    })
    const data = await res.json()
   
    return Response.json({ data })
  }
  